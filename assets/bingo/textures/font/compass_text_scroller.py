import numpy as np
from PIL import Image


def nice_blend(img_above, overlay):
	# From: https://stackoverflow.com/a/64929862
	# Note: img_above is placed above the overlay
	srcRGB = img_above[..., :3]
	dstRGB = overlay[..., :3]
	# Extract the alpha channels and normalise to range 0..1
	srcA = img_above[..., 3] / 255.0
	dstA = overlay[..., 3] / 255.0
	# Work out resultant alpha channel
	outA = srcA + dstA * (1 - srcA)

	outA[outA == 0] = 0.00001
	# Work out resultant RGB
	outRGB = (
		srcRGB * srcA[..., np.newaxis]
		+ dstRGB * dstA[..., np.newaxis] * (1 - srcA[..., np.newaxis])
	) / outA[..., np.newaxis]
	# Merge RGB and alpha (scaled back up to 0..255) back into single image
	outRGBA = np.dstack((outRGB, outA * 255)).astype(np.uint8)
	return outRGBA


if __name__ == "__main__":
	# Number of pixels to scroll each time
	N_PIXEL_SCROLL = 1
    # How many pixels to offset to center 'S'. Play with the value until the
	# overlay is centered on S
	HORIZONTAL_OFFSET = 3
	ROWS = 6

	scroll_image = np.array(Image.open("compass_text_scroll.png"), np.uint8)
	static_image = np.array(Image.open("compass_text_overlay.png"), np.uint8)

	WINDOW_WIDTH = static_image.shape[1]
	WINDOW_HEIGHT = static_image.shape[0]
	OUTPUT_IMAGE_WIDTH = WINDOW_WIDTH * 16
	OUTPUT_IMAGE_HEIGHT = WINDOW_HEIGHT * ROWS * 5
	SECOND_ROW_Y_START = WINDOW_HEIGHT * 5


	output_image = np.zeros((OUTPUT_IMAGE_HEIGHT, OUTPUT_IMAGE_WIDTH, 4), np.uint8)

	# Do an initial scroll of the image so that it lines up over 'S' South
	scrolled_image = np.roll(scroll_image, HORIZONTAL_OFFSET, axis=1)

	for row in range(ROWS):
		for column in range(16):
			# Scroll the image along by N pixel(s)
			scrolled_image = np.roll(scrolled_image, N_PIXEL_SCROLL, axis=1)

			# Crop the first section of the scrolled image
			current_image = scrolled_image[:, :WINDOW_WIDTH]
			# Add the static image on top of it, blending them correctly
			current_image = nice_blend(static_image, current_image)

			# Add to the output image
			output_image[
				row * SECOND_ROW_Y_START : row * SECOND_ROW_Y_START + WINDOW_HEIGHT,
				column * WINDOW_WIDTH : column * WINDOW_WIDTH + WINDOW_WIDTH,
			] = current_image

	# Save image
	img = Image.fromarray(output_image.astype(np.uint8))
	img.save("compass_text.png")
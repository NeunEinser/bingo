#> fetchr:item_detection/goals/points/announce_tie
#
# Sets winner teams subtitles for a tied game.
#
# @within function fetchr:item_detection/goals/points/announce

title @a[tag=fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_team",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.black]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.black] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.blue]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.blue] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.cyan]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.cyan] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.dark_blue]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.dark_blue] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.dark_gray]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.dark_gray] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.dark_red]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.dark_red] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.gray]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.gray] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.green]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.green] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.light_blue]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.light_blue] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.lime]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.lime] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.magenta]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.magenta] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.orange]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.orange] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.purple]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.purple] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.red]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.red] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.white]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.white] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.team_player_count fetchr.tmp \
	if entity @a[team=fetchr.yellow]
execute \
	if score $item_detect/goal.team_player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team,team=fetchr.yellow] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 200,
		multiplier = 750
	}, {
		minlevel = 201,
		maxlevel = 450,
		multiplier = 600
	}, {
		minlevel = 451,
		maxlevel = 700,
		multiplier = 450
	}, {
		minlevel = 701,
		maxlevel = 1200,
		multiplier = 300
	}, {
		minlevel = 1201,
		maxlevel = 1400,
		multiplier = 150
	}, {
		minlevel = 1401,
		multiplier = 100
	}
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 100
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 80
	}, {
		minlevel = 81,
		maxlevel = 110,
		multiplier = 50
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 30
	}, {
		minlevel = 126,
		multiplier = 15
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 20,
		multiplier = 100 --3x mais que o global
	},
	{
		minlevel = 21,
		maxlevel = 35,
		multiplier = 80 --3x mais que o global
	},
	{
		minlevel = 35,
		maxlevel = 60,
		multiplier = 70 --3x mais que o global
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 60
	}, {
		minlevel = 81,
		maxlevel = 100,
		multiplier = 50
	}, {
		minlevel = 101,
		maxlevel = 110,
		multiplier = 40
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 20
	}, {
		minlevel = 126,
		multiplier = 10
	}
}

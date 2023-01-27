-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 8,
		maxlevel = 200,
		multiplier = 999
	}, {
		minlevel = 201,
		maxlevel = 450,
		multiplier = 800
	}, {
		minlevel = 451,
		maxlevel = 700,
		multiplier = 750
	}, {
		minlevel = 701,
		maxlevel = 1200,
		multiplier = 500
	}, {
		minlevel = 1201,
		maxlevel = 1400,
		multiplier = 400
	}, {
		minlevel = 1401,
		multiplier = 100
	}
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 300
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 200
	}, {
		minlevel = 81,
		maxlevel = 110,
		multiplier = 100
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 50
	}, {
		minlevel = 126,
		multiplier = 25
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 250
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 200
	}, {
		minlevel = 81,
		maxlevel = 100,
		multiplier = 150
	}, {
		minlevel = 101,
		maxlevel = 110,
		multiplier = 80
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 40
	}, {
		minlevel = 126,
		multiplier = 20
	}
}

-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
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
		minlevel = 1,
		maxlevel = 30,
		multiplier = 599999
	}, {
		minlevel = 31,
		maxlevel = 70,
		multiplier = 399999
	}, {
		minlevel = 71,
		maxlevel = 110,
		multiplier = 199999
	}, {
		minlevel = 111,
		multiplier = 40000
	}
}

magicLevelStages = {
	{
		minlevel = 1,
		maxlevel = 100,
		multiplier = 599999
	}, {
		minlevel = 101,
		maxlevel = 110,
		multiplier = 89999
	}, {
		minlevel = 111,
		multiplier = 40000
	}
}

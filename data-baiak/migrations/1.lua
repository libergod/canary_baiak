-- return true = There are others migrations file
-- return false = This is the last migration file
function onUpdateDatabase()
    Spdlog.info("Updating database to version 2 (random mount outfit window)")
	db.query("ALTER TABLE `players` ADD `randomize_mount` SMALLINT(1) NOT NULL DEFAULT '0'")
	return true
end

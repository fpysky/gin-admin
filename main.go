package main

import (
	"gin-admin/core"
	"gin-admin/global"
	"gin-admin/initialize"
)

func main() {
	global.VP = core.Viper()
	global.DB = initialize.Gorm()
	router := initialize.Routers()
	router.Run(":8080")
}

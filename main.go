package main

import (
	"gin-admin/initialize"
)

func main() {
	router := initialize.Routers()
	router.Run(":8080")
}

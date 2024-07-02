package api

import "gin-admin/api/test"

type ApiGroup struct {
	TestApiGroup test.ApiGroup
}

var ApiGroupApp = new(ApiGroup)

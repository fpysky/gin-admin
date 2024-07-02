package router

import "gin-admin/router/test"

type RouterGroup struct {
	Test test.Test
}

var RouterGroupApp = new(RouterGroup)

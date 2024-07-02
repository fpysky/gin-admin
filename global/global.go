package global

import (
	"gin-admin/config"
	"github.com/spf13/viper"
	"gorm.io/gorm"
)

var (
	CONFIG config.Server
	DB     *gorm.DB
	VP     *viper.Viper
)

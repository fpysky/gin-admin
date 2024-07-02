package global

import (
	"gin-admin/config"
	"github.com/spf13/viper"
	"go.uber.org/zap"
	"gorm.io/gorm"
)

var (
	CONFIG config.Server
	DB     *gorm.DB
	VP     *viper.Viper
	LOG    *zap.Logger
)

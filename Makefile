# Makefile for C/C++, Obj-C/C++, iOS apps
#
# Written by Federico Sandri <uroboro.845@gmail.com>
# (C) 2012-2013

################################################################

PROJECTNAME = BadgeApp

# if it's an app,
COMPANYNAME = uroboro

# version numbers
VERSION = 0
REVISION = 0
PATCH = 1

# options: c, cplusplus, objc, objcplusplus
LANGUAGE = objc

# options:
# `terminal' for commandline programs
# `ios' for iOS apps
PLATFORM = ios
SDK_VERSION ?= 20

# if language is objc, add frameworks to the list:
FRAMEWORKS = CoreFoundation Foundation UIKit QuartzCore

#CFLAGS = 
#LDFLAGS = 

include ~/code/makefiles/common.mk


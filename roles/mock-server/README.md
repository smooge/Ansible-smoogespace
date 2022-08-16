# Mock for TYT

## What is mock

[Mock](https://github.com/rpm-software-management/mock) is a build tool
used in Red Hat/Fedora environments to seperate building out from a
normal users environment. This allows for the user and build environment
to be cleaner and not accidently pull in unknown dependencies into the
RPM.

## Primary Targets

Mock allows one to build for many different operating systems and
architectures. This tool is meant to only set up working builds for the
targets tyt-(centos8s|rhel8)-(aarch64|x86_64).

## Primary usage

The most effective way for a site to use mock is with a localized mirror
of the content for the packages. This allows for a larger amount of
control of what one feeds into the build environment and cuts down
outside traffic which cuts down either amazon cross network traffic or
just local to your house traffic. (Kids need the network also for
schoolwork.) 

## Need for specific configuration.

While trying to find out how to make mock work with subscription
manager, I found that some systems will be set up to have 'multiple'
entitlements. Each of these entitlements seems to allow for different
things and may or may not work with mock to get packages. Looking at the
data one could find inside each entitlement, I was not able to see why
this was so it seems to be a trial and error to determine which cert
allows for packages. Once you have figured this out per system, you can
set a host var environment per system.


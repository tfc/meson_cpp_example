project('ad', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3', 'cpp_std=c++14'])

inc = include_directories('include')
ad = library('ad',
           'main.cpp',
           include_directories : inc,
           install : true)

install_headers('include/d.hpp')

pkg = import('pkgconfig')
pkg.generate(ad)

project('a', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3', 'cpp_std=c++14'])

c = dependency('libc')
d = dependency('libd')

inc = include_directories('include')
a = library('liba',
           'main.cpp',
           dependencies: [ c, d ],
           include_directories: inc,
           install : true)

install_headers('include/a.hpp')

pkg = import('pkgconfig')
pkg.generate(a,
  libraries: [c, d],
)

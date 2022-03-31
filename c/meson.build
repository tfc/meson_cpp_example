project('libc', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3', 'cpp_std=c++14'])

inc = include_directories('include')
libc = library('libc',
           'main.cpp',
           include_directories : inc,
           install : true)

libc_dep = declare_dependency(include_directories : inc,
  link_with : libc)

install_headers('include/c.hpp')

pkg_mod = import('pkgconfig')
pkg_mod.generate(libraries : libc_dep,
                 version : '1.0',
                 name : 'libc',
                 filebase : 'c',
                 description : 'c library')


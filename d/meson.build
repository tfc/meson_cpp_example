project('libd', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3', 'cpp_std=c++14'])

inc = include_directories('include')
libd = library('libd',
           'main.cpp',
           include_directories : inc,
           install : true)

libd_dep = declare_dependency(include_directories : inc,
  link_with : libd)

install_headers('include/d.hpp')

pkg_mod = import('pkgconfig')
pkg_mod.generate(libraries : libd_dep,
                 version : '1.0',
                 name : 'libd',
                 filebase : 'd',
                 description : 'd library')

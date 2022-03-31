project('libb', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3', 'cpp_std=c++14'])

inc = include_directories('include')
libb = library('libb',
           'main.cpp',
           include_directories : inc,
           install : true)

libb_dep = declare_dependency(include_directories : inc,
  link_with : libb)

install_headers('include/b.hpp')

pkg_mod = import('pkgconfig')
pkg_mod.generate(libraries : libb_dep,
                 version : '1.0',
                 name : 'libb',
                 filebase : 'b',
                 description : 'b library')


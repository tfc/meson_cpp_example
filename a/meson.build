project('liba', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3', 'cpp_std=c++14'])

libc_dep = dependency('c')
libd_dep = dependency('d')

inc = include_directories('include')
liba = library('liba',
           'main.cpp',
           dependencies: [ libc_dep, libd_dep ],
           include_directories : inc,
           install : true)

liba_dep = declare_dependency(
  dependencies: [libd_dep],
  include_directories : include_directories('.'),
  link_with : liba)

install_headers('include/a.hpp')

pkg_mod = import('pkgconfig')
pkg_mod.generate(libraries : liba_dep,
                 version : '1.0',
                 name : 'liba',
                 filebase : 'a',
                 description : 'a library')


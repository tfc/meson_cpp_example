project('a', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3', 'cpp_std=c++14'])

ac = dependency('ac')
ad = dependency('ad')

inc = include_directories('include')
a = library('a',
           'main.cpp',
           dependencies: [ ac, ad ],
           include_directories: inc,
           install : true)

install_headers('include/a.hpp')

pkg = import('pkgconfig')
pkg.generate(a,
  libraries: [ac, ad],
)

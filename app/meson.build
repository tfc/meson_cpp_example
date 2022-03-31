project('myapp', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3', 'cpp_std=c++14'])

liba_dep = dependency('a')
libb_dep = dependency('b')

libc = executable('MyApp',
           'main.cpp',
           dependencies: [ liba_dep, libb_dep ],
           install : true)


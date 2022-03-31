project('myapp', 'cpp',
  version : '0.1',
  default_options : ['warning_level=3', 'cpp_std=c++14'])

a = dependency('a')
b = dependency('b')

c = executable('MyApp',
           'main.cpp',
           dependencies: [a, b],
           install : true)


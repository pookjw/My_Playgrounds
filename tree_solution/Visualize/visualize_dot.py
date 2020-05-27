from graphviz import Source
path = 'node.dot'
s = Source.from_file(path)
s.view()

#!/usr/bin/python
import sys
import random as rand
import numpy as np
import png

if len(sys.argv) < 4:
    print 'Usage: ', sys.argv[0], ' width height delta'
    print 'All args in pixels, delta is the size of cell.'
    sys.exit()

rows = int(sys.argv[1])
cols = int(sys.argv[2])
delta = int(sys.argv[3])

# first four vars tell if there is a wall
# maze(EAST, NORTH, WEST, SOUTH, IS_CHECKED)
maze = np.zeros((rows,cols,5), dtype=np.uint8)

x = 0
y = 0
trace = [(x,y)]

while trace:
    maze[x,y,4] = 1
    check = []
    if y > 0 and maze[x,y-1,4] == 0:
        check.append('E')
    if x > 0 and maze[x-1,y,4] == 0:
        check.append('N')
    if y < cols-1 and maze[x,y+1,4] == 0:
        check.append('W')
    if x < rows-1 and maze[x+1,y,4] == 0:
        check.append('S')

    if len(check):
        trace.append([x,y])
        direction = rand.choice(check)
        if direction == 'E':
            maze[x,y,0] = 1
            y = y - 1
            maze[x,y,2] = 1
        if direction == 'N':
            maze[x,y,1] = 1
            x = x - 1
            maze[x,y,3] = 1
        if direction == 'W':
            maze[x,y,2] = 1
            y = y + 1
            maze[x,y,0] = 1
        if direction == 'S':
            maze[x,y,3] = 1
            x = x + 1
            maze[x,y,1] = 1
    else:
        x,y = trace.pop()

f = open('maze.png', 'wb')
image = []
curstr = '0'
for r in range(0,2*rows):
    for c in range(0,cols):
        if r == 0:
            curstr = curstr + '00'
        elif r % 2 == 1:
            curstr = curstr + '1' + str(maze[(r-1)/2,c,2])
        else:
            curstr = curstr + str(maze[(r-1)/2,c,3]) + '0'
    if not r == 0 and r % 2 == 0:
        curstr = curstr + '0'
    image.append(curstr)
    curstr = '0'
wrtr = png.Writer(len(image[0]), len(image), greyscale=True, bitdepth=1)
wrtr.write(f, image)
f.close()

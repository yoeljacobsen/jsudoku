NB. Based on https://dfns.dyalog.com/n_sudoku_bfs.htm
cell =: 3 : '(2$y) $ i. y ^2'       NB. yxy cell
row =: 3 : 'y#"1 cell y'            NB. row of cells
box =: 3 : 'y# row y'               NB. box of cells
ig =: 3 : '{(i.y);(i.y)'        NB. Index generator
rcb =: 3 : '(ig y) , each box %:y'    NB. row-column-box indices
subset =: 4 : '+./ x =/ y'          NB. Bit vector of shape y with matching elements from x
cmap =: 3 : '<"2 > +./ each y = each/ y'
NB. (< 2 1) avl s44
cellmap =: 3 : 'cmap rcb y' M.   NB. Takes dim. Memoize.
digits =: 3 : 'i. >: y' M.
avl =:  4 : 'I. (digits #y) -.@e. , y* > x { cellmap # y'
pvec =: 4 : '<"2 (x avl y) x}"0 _  y'
unravel =:  3 : '(I. >0&<@# each ,> y) { ,> y'
pvex =: 4 : 'unravel (x&pvec) each y'
NB. (<1 0) pvex (< 1 1) pvex (<0 0) pvex <s44
NB. pvex/ (2 1; 1 0; 1 1; 0 0; s44)
ept =: 3 : '(I. ,y=0) { ,ig #y'   NB. Empty indices
svec =: 3 : 'pvex/ (ept y),<y'

s44 =: (4 4) $ 0 0 0 0 0 0 2 1 3 0 0 4 0 0 0 0

s98 =: 9 9 $ , 0&".;._2 (0 : 0)
 2 0 0  6 7 0  0 0 0
 0 0 6  0 0 0  2 0 1
 4 0 0  0 0 0  8 0 0
 5 0 0  0 0 9  3 0 0
 0 3 0  0 0 0  0 5 0
 0 0 2  8 0 0  0 0 7
 0 0 1  0 0 0  0 0 4
 7 0 8  0 0 0  6 0 0
 0 0 0  0 5 3  0 0 8
)

s99 =: 9 9 $ , 0&".;._2 (0 : 0)
 0 0 1  6 9 0  5 0 0
 4 0 0  2 7 0  0 0 1
 0 7 0  0 0 0  0 9 0
 0 0 0  0 0 0  0 3 0
 0 0 0  4 3 0  0 0 7
 0 0 0  7 8 0  6 0 0
 0 0 6  0 0 0  8 0 5
 0 2 0  1 4 0  0 6 0
 0 1 0  3 5 0  0 4 0
)


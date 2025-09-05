import random
import time
import os

def change_line(characters, str, symbol_set):
    
    str = list(str)
    for i in characters:
            
            str[i] = symbol_set[random.randint(0, 6)] 

    str_r = ""

    for i in str:
         
            str_r += i

    return str_r
def create_new_skull():
    
    skull =["                           (                                 ",
            "                .            )        )                      ",
            "                         (  (|              .                ",    
            "                     )   )\/ ( ( (                           ",
            "             *  (   ((  /     ))\))  (  )    )               ",
            "           (     \   )\(          |  ))( )  (|               ",
            "           >)     ))/   |          )/  \((  ) \              ",
            "           (     (      .        -.     V )/   )(    (       ",
            "            \   /     .   \            .       \))   ))      ",
            "              )(      (  | |   )            .    (  /        ",
            "             )(    ,'))     \ /          \( `.    )          ",
            "             (\>  ,'/__      ))            __`.  /           ",
            "            ( \   | /  ___   ( \/     ___   \ | ( (          ",
            "             \.)  |/  /   \__      __/   \   \|  ))          ",
            "            .  \. |>  \      | __ |      /   <|  /           ",
            "                 )/    \____/ :..: \____/     \ <            ",
            "          )   \ (|__  .      / ;: \          __| )  (        ",
            "         ((    )\)  ~--_     --  --      _--~    /  ))       ",
            "          \    (    |  ||               ||  |   (  /         ",
            "                \.  |  ||_             _||  |  /             ",
            "                  > :  |  ~V+-I_I_I-+V~  |  : (.             ",
            "                 (  \:  T\   _     _   /T  : ./              ",
            "                  \  :    T^T T-+-T T^T    ;<                ",
            "                   \..`_       -+-       _'  )               ",
            "                      . `--=.._____..=--'. ./                ",
            "                                                             "
            ]


    

    new_skull = skull

    symbol_set_1 = ["(", ")", "\\", "/", "^", "_", "*"]
    symbol_set_2 = ["$", "$", "$", "$", "$", "$", "$",]
    for i in range(len(new_skull)):

        if i == 0:
            new_skull[i] = change_line((random.randint(25, 35) for _ in range(random.randint(1, 6))), skull[i], symbol_set_1) 
        if i == 1:
            new_skull[i] = change_line((random.randint(23, 38) for _ in range(random.randint(1, 6))), skull[i], symbol_set_1) 
        if i == 2:
            new_skull[i] = change_line((random.randint(20, 40) for _ in range(random.randint(1, 6))), skull[i], symbol_set_1)   
        if i >= 3 and i <= 5:
            new_skull[i] = change_line((random.randint(15, 45) for _ in range(random.randint(1, 10))), skull[i], symbol_set_1) 
        if i >= 6 and i < 10:
            new_skull[i] = change_line((random.randint(10, 50) for _ in range(random.randint(1, 10))), skull[i], symbol_set_1) 
        if i == 10:
            new_skull[i] = change_line((random.randint(10, 50) for _ in range(random.randint(1, 15))), skull[i], symbol_set_1)    
        if i == 11:
            new_skull[i] = change_line((random.randint(15, 45) for _ in range(random.randint(1, 20))), skull[i], symbol_set_1) 
        if i == 12:
            new_skull[i] = change_line((random.randint(10, 50) for _ in range(random.randint(1, 15))), skull[i], symbol_set_1) 
        if i == 13:
            new_skull[i] = change_line([random.randint(23,25) for _ in range(random.randint(2,3))] + [random.randint(38,40) for _ in range(random.randint(2,3))], skull[i], symbol_set_2) 
        if i == 14:
            new_skull[i] = change_line([random.randint(23,27) for _ in range(random.randint(3,3))] + [random.randint(35,41) for _ in range(random.randint(3,3))], skull[i], symbol_set_2) 
        if i == 15:
            new_skull[i] = change_line([random.randint(24,27) for _ in range(random.randint(2,3))] + [random.randint(36,40) for _ in range(random.randint(2,3))], skull[i], symbol_set_2)
        if i == 16:
            new_skull[i] = change_line([random.randint(12,14) for _ in range(random.randint(1,1))] + [random.randint(17,20) for _ in range(random.randint(1,1))] + [random.randint(45,50) for _ in range(random.randint(1,1))] + [random.randint(49,51) for _ in range(random.randint(1,1))], skull[i], symbol_set_1) 
        if i == 17:
            new_skull[i] = change_line([random.randint(11,14) for _ in range(random.randint(1,1))] + [random.randint(16,20) for _ in range(random.randint(1,1))] + [random.randint(46,51) for _ in range(random.randint(1,1))] + [random.randint(50,51) for _ in range(random.randint(1,1))], skull[i], symbol_set_1) 
        if i == 18:
            new_skull[i] = change_line([random.randint(12,14) for _ in range(random.randint(1,1))] + [random.randint(17,20) for _ in range(random.randint(1,1))] + [random.randint(45,50) for _ in range(random.randint(1,1))] + [random.randint(49,51) for _ in range(random.randint(1,1))], skull[i], symbol_set_1)
        if i == 19:
            new_skull[i] = change_line([random.randint(15,24) for _ in range(random.randint(2,3))] + [random.randint(40,49) for _ in range(random.randint(2,3))], skull[i], symbol_set_1)
        if i >= 20 and i <= 22:
            new_skull[i] = change_line((random.randint(23, 41) for _ in range(random.randint(4, 12))), skull[i],symbol_set_1) 
        if i == 23:
            new_skull[i] = new_skull[i] 
        if i == 24:
            new_skull[i] = change_line((random.randint(23, 38) for _ in range(random.randint(1, 6))), skull[i], symbol_set_1) 
        if i == 25:
            new_skull[i] = change_line((random.randint(25, 35) for _ in range(random.randint(1, 6))), skull[i], symbol_set_1) 

    return new_skull




while True:

    
    image = create_new_skull ()

    for i in image:
         print(i) 

    time.sleep(0.125)

    os.system('cls')
    
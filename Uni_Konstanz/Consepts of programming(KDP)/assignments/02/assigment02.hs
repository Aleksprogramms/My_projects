import Text.Regex.Posix ((=~))

--Aufgabe 1 (rot)
evenNumberRegex :: String
evenNumberRegex = "^(0|[1-9][0-9]*[02468])$"

--[JFM] Einstellig gerade Zahlen sind nicht mit eingeschlossen: 2, 4, 6, 8

isEvenNatural :: String -> Bool
isEvenNatural s = s =~ evenNumberRegex

main :: IO ()
main = do
    putStrLn "(----Aufgabe 1----)"
    print $ isEvenNatural "0"     
    print $ isEvenNatural "2"     
    print $ isEvenNatural "8"     
    print $ isEvenNatural "10"    
    print $ isEvenNatural "1234"  
    print $ isEvenNatural "1235"  
    print $ isEvenNatural "012"   
    putStrLn "(----Aufgabe 2----)"
    putStrLn "12 * 34 * 56"
    putStrLn "12 * 34 wir schauen auf Product (Regel: Product -> Product * Singleton)"
    putStrLn "12 * 34 * 56 wir schauen auf Product (Regel: Product -> Product * Singleton)"
    putStrLn "erstes Element - Sum"
    putStrLn "Sum -> Product"
    putStrLn "Product -> Product * Singleton"
    putStrLn "Product -> Product * Singleton * Singleton"
    putStrLn "Product -> Singleton * Singleton * Singleton"
    putStrLn "Regel: Singleton -> Z"
    putStrLn "Singleton -> 13 * Singleton * Singleton"
    putStrLn "Singleton -> 13 * 34 * Singleton"
    putStrLn "Singleton -> 13 * 34 * 56"
    
    putStrLn "2 + 3 * (4 + 5)"
    putStrLn "4 + 5 wir schauen auf Sum (Regel: Singleton -> (Sum))"
    putStrLn "3 * (4 + 5) wir schauen auf Product (Regel: Product -> Product * Singleton)"
    putStrLn "2 + 3 * (4 + 5) wir schauen auf Sum (Regel: Sum -> Sum +  Product)"
    putStrLn "erstes Element - Sum"
    putStrLn "Sum -> Sum + Product"
    putStrLn "Product -> Sum + Product * Singleton"
    putStrLn "Singleton -> Sum + Product * Sum"
    putStrLn "2 + Product"
    putStrLn "2 + 3 * Singleton"
    putStrLn "2 + 3 * Sum"
    putStrLn "2 + 3 * (4 + 5)"
    putStrLn "(----Aufgabe 3----)"
    putStrLn "(738/6)/3"
    putStrLn "Parse-tree: "
    putStrLn "           Sum  "
    putStrLn "            |   "
    putStrLn "         Product"
    putStrLn "       |        "
    putStrLn "    Product / Singleton"
    putStrLn "    |             |    "
    putStrLn "Singleton        Z(3)  "
    putStrLn "    |    "
    putStrLn "  Z(738) /  Singleton "
    putStrLn "                |     "
    putStrLn "               Z(6)   "
    putStrLn "AST:"
    putStrLn "    (/)  "
    putStrLn "    /  \\ "
    putStrLn "  (/)   3 "
    putStrLn " /  \\   "
    putStrLn "738  6"
    putStrLn "\n"
    putStrLn "Ergebnis: (738/6)/3 = 123/3 = 41"
    putStrLn "738/(6/3)"
    putStrLn "Parse-tree: "
    putStrLn "                  Sum                       "
    putStrLn "                   |                        "
    putStrLn "                Product                     "
    putStrLn "                   |                        "
    putStrLn "    Singleton      /  Product              "
    putStrLn "        |                |                 "
    putStrLn "      Z(738)   Singleton / Singleton"
    putStrLn "                   |            |    " 
    putStrLn "                  Z(6)         Z(3)  "
    putStrLn "AST:"
    putStrLn "    (/)  "
    putStrLn "    /  \\ "
    putStrLn "  738   (/) "
    putStrLn "        /  \\"
    putStrLn "        6   3  "
    putStrLn "\n"
    putStrLn "Ergebnis: 738/(6/3) = 738/2 = 369"
    
    
--[JFM] Dieses Blatt war keine Programmieraufgabe, es wäre nicht nötig gewesen, das als Haskell code zu schreiben. 
--[JFM] Die Induktionsaufgabe passt von der Idee her, es fehlen allerding Induktionsanfang und -vorraussetzung. 
--[JFM] Ich bitte außerdem darum, von handschriftlichen Lösungen abzusehen.


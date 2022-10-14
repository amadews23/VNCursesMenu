using Curses;

    public delegate void DelegateType(string a); 
    
    
    public void print_text(string a) {

        mvprintw(14,0,"Imprime %s",a);
    }


    public static int main(string[] args) {

        DelegateType d = print_text;
        

        ElementoMenu elementoMenu01 = new ElementoMenu("Seccion 0.1",d,"titulo0");
        ElementoMenu elementoMenu02 = new ElementoMenu("Seccion 0.2",d,"titulo1!!!");
        ElementoMenu elementoMenu03 = new ElementoMenu("Seccion 0.3",d,"Titulo2");
        ElementoMenu elementoMenu04 = new ElementoMenu("Menu 2",d,"Menu 2");
        
        ElementoMenu elementoMenu20 = new ElementoMenu("Seccion 1.1",d,"Titulo 10");
        ElementoMenu elementoMenu22 = new ElementoMenu("Seccion 1.2",d,"Titulo11!");
        ElementoMenu elementoMenu23 = new ElementoMenu("Seccion 1.3",d,"titulo12");        
        ElementoMenu elementoMenu24 = new ElementoMenu("Atras",d,"atrás");        
        
   	ElementoMenu[] elementosMenu = { elementoMenu01,
   	                                 elementoMenu02,
   	                                 elementoMenu03,
   	                                 elementoMenu04 };
   	                                 
   	ElementoMenu[] elementosMenu2 = { elementoMenu20,
   	                                 elementoMenu22,
   	                                 elementoMenu23,
   	                                 elementoMenu24 };    	                                 
   	                                           
   	
   	elementoMenu04.set_elementosMenu(elementosMenu2); 

   	elementoMenu24.set_elementosMenu(elementosMenu); 

    	var menu1 = new UnMenu(elementosMenu);


    	menu1.start();
    	menu1.activate();
    	menu1.redraw();
    	menu1.run();
    	menu1.stop();    

    		 

       
        return 0;
    }

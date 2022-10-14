/*
*/


using Curses;
using Posix;
public class UnMenu : Object {

	public MainLoop loop;
	private IOChannel io_channel;
  internal IOSource io;
  private string[] choices;
  private ElementoMenu[] elementosMenu;
  	
  private Menu menu; 	
  private MenuItem[] menu_items = {};
  	
  public UnMenu( ElementoMenu[] elementosMenu )
  {
  
    loop = new MainLoop();
    io_channel = new IOChannel.unix_new(Posix.STDIN_FILENO);
    io = new IOSource(io_channel, IOCondition.IN);
    io.attach(loop.get_context());
    		
    change_elementosMenu(elementosMenu);

  }

  public void start() {
    
  	initscr();
  	noecho();
  	stdscr.keypad(true);
  }

  public void stop() {
    
  	endwin();
  }

	public void change_elementosMenu( ElementoMenu[] elementosMenu) {
	
		this.menu_items = null;	  
    this.elementosMenu = elementosMenu;    		
    this.choices = new string[elementosMenu.length+1];
    		
  	for (int i = 0; i < elementosMenu.length ; i++) {
  		
      this.choices[i] = elementosMenu[i].get_titulo();
  		        
  	} 
  	
    this.choices[elementosMenu.length] = "Exit";
  	
  		
    foreach (unowned string choice in choices) {

      			this.menu_items += new MenuItem(choice,"  ");//, choice);
    }
    /*for (int i = 0; i < this.choices.length; i++) {
    		
    			this.menu_items += new MenuItem(choices[i]," ");
    }*/
	    	
	}



  public void activate() {

  		this.menu = new Menu(menu_items);
   		this.menu.post();
   		refresh();  	
		
		  int posicion = 1;
    	
      io.set_callback(() => {
      
        var c = getch();

     		switch (c) {
        
          case Key.DOWN:
            this.menu.driver(MenuRequest.DOWN_ITEM);
          	
            if (posicion < choices.length) {
              posicion++;
          	}
            
            mvprintw(12,0,"posicion %i",posicion);
                      			
          	break;
          				
        		case Key.UP:
          	
              this.menu.driver(MenuRequest.UP_ITEM);
          		if (posicion > 1) {
            	  posicion--;
          		}
              mvprintw(12,0,"posicion %i",posicion);
          		break;
          				
        			case 10:
         			  mvprintw(12,14,"ENTER %i",posicion);
                      			
                      			
                if (posicion == choices.length) {
                  loop.quit();
                  return Source.REMOVE; //Al anyadir esta linea me permite salir

					      } else {                     			
                      			
                  if (elementosMenu[posicion-1].get_is_open_menu () == true) {

							      clear();
                    change_elementosMenu(elementosMenu[posicion-1].get_elementosMenu());
                    this.menu = new Menu(this.menu_items);
    							  this.menu.post();    							
                    posicion = 1;    							                     			        							  								

                  } else {

							      elementosMenu[posicion-1].my_method();
						  }
					  }
            break;
          				
        		default:
          	  break;
      			}

      			refresh();

      			return Source.CONTINUE;
    		});
  	}

  	public void run() {
    		loop.run();
  	}

  	public void redraw() {
    		refresh();
  	}

}  	

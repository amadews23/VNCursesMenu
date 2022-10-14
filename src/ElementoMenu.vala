public class ElementoMenu : Object {

    private string titulo;
    private DelegateType delegateType;
    private string a;

    private bool is_open_menu = false; 
    private ElementoMenu[] elementosMenu;
        

    public ElementoMenu(string titulo,
                        DelegateType delegateType,
                        string a) 
    {

        this.titulo = titulo;
        this.delegateType = delegateType;  //TODO El compilador devuelve un Warning: warning: copying delegates is not supported

        this.a = a;
    }
    
    /*public void set_is_open_menu( bool is_open_menu) {
    
    	this.is_open_menu = is_open_menu;
    }*/
    
    public void set_elementosMenu (ElementoMenu[] elementosMenu) {
    
    	this.elementosMenu = elementosMenu;
    	
    	this.is_open_menu = true;
    } 
    
    public bool get_is_open_menu () {
    
    	return this.is_open_menu;
    }

    /*public void set_titulo(string titulo) {
       this.titulo = titulo;
    }*/
    
    public string get_titulo() {
        return this.titulo;
    }
    public ElementoMenu[] get_elementosMenu() {
    	return this.elementosMenu;
    }
    /*public void set_delegateType(DelegateType delegateType) {
       this.delegateType = delegateType;
    }*/
    
    public void my_method() {
    
    	if (is_open_menu == false) {
      
        	this.delegateType(a);
        }
    }  
}

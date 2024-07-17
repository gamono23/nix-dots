{
  programs.wofi = {
    enable = true;
    style = ''
      * {
        font-family: JetBrains Mono;
      } 

      #window {
        background-color: #434c5e;
        border-radius: 20px;
      }
      
      #outer-box {
        opacity: 1;
        border-radius: 20px;
        color: #eceff4;
      }

      #input {
        border-radius: 10px;
        background-color: #4c566a;
        color: #eceff4;
      }

      #entry:selected {
        background-color: #4c566a;
        border-radius: inherit;
        border: none;
      }
    '';
  };
}

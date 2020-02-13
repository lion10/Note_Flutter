
class InsertNote{

 String  noteTitle;
 String  noteContent;

 InsertNote({this.noteTitle ,this.noteContent});

  Map<String ,dynamic> toJson() {
    return {
      "noteTitle" : noteTitle ,
      "noteContent" :noteContent
    };
  }

}
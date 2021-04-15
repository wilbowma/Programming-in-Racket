#lang scribble/manual

@title{Interpreters}

@table-of-contents[]

@section[#:tag "QUestions"]{Thoughts}



Some random thoughts as I am learning how to design interpreters. 

@itemize{
    @item{Why do humans keep coming up with new and different types of libraries for defining interpreters? }
    @item{Why are these librariries better than using no library? }
    @item{How must a beginner start to think about desgining an interpreter?}
}

@section[#:tag "intro"]{introduction}

Learning to design an interpreter seems to be a very important 
step in understanding the design and interpretation of programming languages. 

I think the reason is fairly obvious, which is 

@itemize{
    @item{How can one one interpret a languuage without building an actual interpreter for it?}
    @item{It helps one understand how different syntax in a programming language will be "interepreted"?}
    @item{Depending on the level of abstraction, perhaps one can even learn about different design decisions that 
    go in a language. -- I am sure, PL experts know this better than me, however, this is my way of looking at it. }
}


@section[#:tag "interpreter1"]{Interpreter - 1}

The general approach towards building this interpreter seems to be:

@itemize{
    @item{Design the general structure of how the overall interpretation must work}
    @item{Then move on to designing the evaluator for the expressions in the language, the general assumption here
    I think would be that we are somewhat aware about our language syntax}
    @item {Then we design the apply for the language and this is where the metacircular notion of eval-apply comes into 
    picture.}
    @item{Within the eval we would require a substitution model to describe how the values are substituted in presence of free 
    and bound variables.}
}


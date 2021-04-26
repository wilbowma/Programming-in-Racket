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

@section[#:tag "intervlan"]{Interpreter vs Languages vs Compilers}


SO I had a thought, what is the difference between an Interpreter, Language and a Compiler?

This is an interesting question because I have been trying to understand different ways of 
building a interpreter in Racket. 
That is when a question struck my head which was, is there a difference between saying
"Designing a Language" and "Designing an Interpreter"? 

There is no such comparison between the two I think, the reason is languages are plain 
programming languages, and interpreters are something that run those programming languages. 

A programming language consists of syntax, and rules that tells us what the syntax even means. 
To test it out, we build an interpreter which is a program. 

A compiler is also similar to an interpreter however, I think the difference is that the Compiler
has the notion of offline translations that allows one to add optimizations as and when needed. 

@margin-note{build one toy compiler soon.}



@section[#:tag "interpreter1"]{Interpreter - 1}

The general approach towards building this interpreter seems to be:

@itemize{
    @item{Design the general structure of how the overall interpretation must work}
    @item{Then move on to designing the evaluator for the expressions in the language, the general assumption here
    I think would be that we are somewhat aware about our language syntax}
    @item{Then we design the apply for the language and this is where the metacircular notion of eval-apply comes into 
    picture.}
    @item{Within the eval we would require a substitution model to describe how the values are substituted in presence of free 
    and bound variables.}
}


@section[#:tag "interpreter2"]{Interpreter - 2}

The library I am using for designing the second interpreter is algebric, which seems to
be a library for converting models to interpreters. 

This approach seems a little more systematic to me as compared to the approach I used in 
desgining the first interpreter. 





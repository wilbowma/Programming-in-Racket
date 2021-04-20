#lang scribble/manual

@title{Designing a Language in Racket}
@table-of-contents[]

@section[#:tag "dsl"]{Designing a programming language}

Some thoughts about this, the core thing involved in designing a 
domain specific programming language involve the following:
design new notation and behaviour for a programming language, 
write the racket program that takes source code in new language and 
converts it into equivalent program, finally, run the racket program. 

It's all about perspective and the way we are actually looking at this. 
If we logically think about it, the source code is nothing but code
being written in racket. 
We are basically writing code in Racket that compiles to Racket which 
then runs normally. 
This is quite cool.
Making a transcompiler is the key in the process of creating a new
application. 

There is the reader and the expander. It took me some time to 
really absorb these ideas. 

@subsection[#:tag "Reader"]{Reader}


Reader is what converts the syntax into s-expressions which is
the default way racket interprets syntax. 
What this means is that we can define new syntax in a racket file
however, that syntax needs to be converted into a form that can 
be interpreted by Racket compiler which is in form of s-expressions. 

The reader: the main goal is to create modules within this.
This newly created module is packaged as a syntax object.
(A little digression into what a syntax object is: )

@margin-note{Now though based on the video I watched, they are planning to replace
the s-expressions to make it more accessible for "real" sort of languages
apparently. }


@subsection[#:tag "expander"]{Expander}
The expander is the way we can interpret the syntax of that language and 
give it meaning. 


Racket will replace the original source code with the module 
that we are creating as a syntax object. 

Now this module invokes the expander which is what triggers the full
expansion of the module. 
The expander can be an old module such as br or racket itself or it can 
be a completely new language that we have created for our purposes. 

I found this a very clever way to extend exisiting languages to add 
more features to it and work with it. 


@section[#:tag "abst"]{Racket Abstractions}

There are modules.  
Each module can contain submodules

Each module consists of multiple functions (?)
within itself.

@section[#:tag "covered"]{Things covered from BR tut}

Explainers: Recursion, Continuations, lang-line, 


#lang scribble/manual

@title{Imperative to functional}

@table-of-contents[]
@margin-note{I need to add concrete racket examples to explain 
these concepts a little better.}

@section[#:tag "language"]{Learning a Programming Language}



Learning any programming language requires a lot of effort and investment
of time. 
The most precise way to look at what a language really contains is 
something that I picked up from Dan Grossman's video according to which
there are five things that are required in the process to master any 
programming language. 
@itemlist[
    @item{Syntax: This is perhaps the most obvious bit when we look at a 
    programming language.}
    @item{Semantics: This is what gives meaning to the above syntax}
    @item{Idioms: These are which features of the language should be used when; means 
    that we have the notion of tuples and records in functional languages, tuples are
    syntactic sugar on record, when should tuples be used and when should records be used?
    especially since they are pretty much the same things.}
    @item{Libraries: This one is quite obvious, basically something like language extensions 
     since the more hold we have on the libraries and their understanding, the bigger software
     we will be able to write with much ease.}
    @item{Tools: For every language, debugging and other such tools are very important to understand. 
    Again this can speed up the process.}
]

The important thing according to me (and after watching Dan Grossman's lectures) is that 
understanding the semantics and idioms is probably the important bits. 
Previously when I learned the imperative language I never really focused on the 
understanding the semantics in depth. 
My core focus was on libraries and seeing what does what. However, now I can see why that 
was not the most appropriate way to proceed when learning a programming language. 

@section[#:tag "Transition"]{Transition from imperative to functional}

The languages that I have previously coded in are C, C++, Java, Python.
The general concepts overall were quite similar for me. 
Also, when I worked with the above mentioned languages my core focus 
was the application rather than learning about the language. 
Hence, this is the reason I concentrated more on learning the libraries
and using them for the application than understanding the semantics or the
idioms. 



@subsection[#:tag "Concepts"]{Language Concepts}

Based on my past experience I did not find imperative style languages to have a lot of
concepts in general. 
They are pretty straighforward (but I am sure that's subjective opinion.)

Also, the concepts which do exist in those languages are quite different from the ones
found in functional style languages. 
The main difference is in the existance of states in imperative style languages. 
The existance of states allows the languages to track the variable values in a program 
to understand where the program is currently at. 
The states or the values in the states are updated based on how the program transitions 
in the next step. 

Due to this imperative languages have a lot of power that allows mutability of variables
when transitioning from one state to another. 

In functional style languages states do not exist and since everything is written in form 
of a lambda, and there are many many interesting concepts such as different notons for defining
bindings in functional languages. 

In Racket, the reason I specifically mention Racket because it is the first language I 
am actually putting in real effort to understand the language design. 

@subsection[#:tag "Types"]{Type Systems}

Another interesting thing that I found about functional style languages was the existance of 
types. 
Before entering the functional language wonderland, I really did not know that types could
play such a significant role in the world of programming languages. 
The most introduction that I have had to the world of types were the datatypes that are used 
in C type languages. 
Maybe there was more to look into there too, however, I never paid much attention to it.

In a very high level explanation the existance of types definitely helps in finding more 
errors in the programs. 

@subsection[#:tag "Sugar"]{Syntactic sugar and macros}

I was introduced to the beautiful concepts of syntactic sugar and macros as I proceeded 
towards learning Racket in more depth. 
Sugar is the syntax wrapper to ease the implementation of certain things such as tuples 
are syntactic sugar for records. 

Also, the most I knew about macros were that they expand out the code and to be really 
honest I saw them as something similar to functions. 
However, getting introduced to macros in the functional world land, the thing that I have 
realised is that macros are such a beautiful concept. 

The mappings of certain keywords to the their expansion is not entirely as trivial 
as I thought it would be. 
There is still a lot that I do not entirely understand but I think there is a lot to 
learn from that and understand the tricks that are going on in there. 


@section[#:tag "Egs"]{let, Let*, letrec and define}

Why do I have a seperate section on this?
Well, these are some of the interesting things that I found while learning Racket. 

This really helped me understand "how semantics play an important role in understanding 
certain things". 
The core purpose of these three is mostly for bindings.
However, these three have different purposes in terms and have different semantics. 

This is the first time I noticed in practice how small modifications in the semantics 
can be so useful. 
Before this my thinking was in a different direction where while designing the semantics
I would try to observe the real thing and try to model that exactly the way i saw it, 
it only took me some time to realise that that is not the case. 





 


 

# Ruby App

The Ruby App is a Ruby command line application that

- reads server logs from a provided logs file,
- processes/classifies the input,
- displays the visit count by page,
- displays the unique view count by page

This program is written in Ruby as it supports the object oriented programming paradigm, which allows
using of classes to define blueprint of entities from which objects are created and perform different
operations on. It supports interaction with the terminal.
The are other programming languages with OOP, but this is my language of focus given it's simplicity
and huge community.

## StdInput

StdInput Module has the static method read_file which is responsible for reading the server logs file
and return an array of each line as a string.

## WebServerAnalyzer

The WebServerAnalyzer class is an Analytics service that processes the provided input and displays the result.

## Technologies and Librairies used

- Ruby 3.0.3p157
- RSpec 3.11

## Installation & Usage

Download and install Ruby from https://www.ruby-lang.org/en/documentation/installation/

Clone the repository to your local machine

$git clone git@github.com:ngodi/web_server_analyzer.git

cd into the 'web_server_analyzer' directory,
$cd web_server_analyzer

run 'bundle install'; to install required libraries/gems

## Running the program

- open the terminal
- run program while passing the server logs; by entering: $ruby run_program.rb data/webserver.log

## Testing

From the program directory;

- open the terminal
- run rspec from the terminal
- view results

## Author

Ngodi albert

- Github: [@ngodi](https://github.com/ngodi)
- Twitter: [@albertngodi](https://twitter.com/albertngodi)
- Linkedin: [linkedin](https://www.linkedin.com/in/albertngodi/)

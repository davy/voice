voice
=====

Provides access to OSX say command and custom voices

Voice allows access to some of the internals of the OSX say command. Available voices are determined by what's available on your system.

To see what voices are available:

    Voice.all

OSX's novelty voices are kinda really annoying, and are not included by default. You are able to include them, or to use them exclusively.

    Voice.all(:novelty => 'include')
    Voice.all(:novelty => 'only')

To use Voice, simply call say. You can use the default voice, specify a voice, ask for a random voice, and either exclude (by default), include or only use the novelty voices.

    Voice.say('hello world')
    Voice.say(';)')
    Voice.say('a dingo ate my baby', :voice => 'Lee')
    Voice.say('hello world', :random => true)
    Voice.say('hello world', :random => true, :novelty => 'include')
    Voice.say('hello world', :random => true, :novelty => 'only')


Use the Say module to access the say command directly. Voice passes the options hash down to Say.


    Say.say('hello')
    Say.say('hello! =D')
    Say.say('hello! =D', :voice => 'Samantha')
    Say.say('hello! =D', :no_emoticons => true)


OTHER OPERATING SYSTEMS
-----------------------

This hasn't been tested at all on Windows or other Linux distros, where it is expected to not be functional. The hope is that it gracefully errors, if not please let me know.

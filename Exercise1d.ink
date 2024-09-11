
VAR neighbor = ""
~ neighbor = "{~Jerry|Jeff|Joe}"

VAR microwaveT = -1
VAR timerT = -1
VAR toasterT = -1
VAR alarmT = -1

-> dorm

== dorm ==
You are standing in your dorm room.
{Your neighbor is named {neighbor}. For some reason, you really, really do not like {neighbor}. Today you woke up and decided to make his life miserable. It is four at night and you wish to make enough noise to wake him up. But, because {neighbor} is a deep sleeper, you will need to make a LOT of noise ALL AT ONCE in order to wake him...|{passTime()}}
{microwaveT == 0 && timerT == 0 && toasterT == 0 && alarmT == 0:The combined sounds of all of your beeping appliances cause the room to rattle. -> wakeNeighbor}
+ [Start the microwave] -> microwave
+ [Start the timer] -> timer
+ [Start the toaster] -> toaster
+ [Start the alarm] -> alarm
//+ [Scream] -> scream
-> DONE

== microwave
You start the microwave. In 30 seconds it will stop.
~ microwaveT = 1
+ [Continue] -> dorm
-> dorm

== timer
You start the timer. In 60 seconds it will stop.
~ timerT = 2
+ [Continue] -> dorm
-> DONE

== toaster
You start the toaster. In 90 seconds it will stop.
~ toasterT = 3
+ [Continue] -> dorm
-> DONE

== alarm
You start the alarm. In 120 seconds it will stop.
~ alarmT = 4
+ [Continue] -> dorm
-> dorm

/*
== scream
You scream at the top of your lungs.
{microwaveT == 0 && timerT == 0 && toasterT == 0 && alarmT == 0:The combined sounds of your horrible screech and all of the beeping appliances cause the room to rattle. -> ending}
+ [Continue] -> dorm
-> DONE
*/

== function passTime ==
    // All timers tick forward
    ~ microwaveT = microwaveT - 1
    ~ timerT = timerT - 1
    ~ toasterT = toasterT - 1
    ~ alarmT = alarmT - 1
    
    30 seconds pass. {microwaveT == 0:The microwave stops and beeps loudly.|} {timerT == 0:The timer stops and beeps loudly.|} {toasterT == 0:The toaster stops and beeps loudly.|} {alarmT == 0:The alarm stops and beeps loudly.|}
        
    ~ return

== wakeNeighbor ==
    {neighbor} is startled awake by your atrocious cacophony. You know this because you hear him give a terrified shout before tumbling out of bed and crashing onto the floor.
    + [Mess with {neighbor}] -> visitNeighbor
-> DONE
    
== visitNeighbor ==
    You leave your room and knock on {neighbor}'s door.
    "What's going on!?" {neighbor} asks. Feeling mischevious and cruel, you turn the question back on him.
    "That's what I wanted to ask you! I was trying to sleep, but I was woken up by a scream and an awful thud that came from your room," you lie.
    "Oh, um, sorry. I thought I heard something, so I jumped out of bed," {neighbor} replies guiltily.
    "It's the middle of the night, {neighbor}, Please keep quiet so I can sleep!" you say, toying with him. You close his door and return to your room with a wickedly evil feeling. Its not easy being {neighbor}'s archnemesis, but someone has to make his life miserable.
    
-> END



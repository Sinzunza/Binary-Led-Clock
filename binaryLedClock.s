.equ LOW,0
.equ HIGH, 1
.equ INPUT, 0
.equ OUTPUT, 1

//gpio pin numbers
.equ secondOnes, 17
.equ secondTwos, 27
.equ secondFours, 22
.equ secondEights, 10
.equ secondSixteens, 9
.equ secondThirtyTwos, 11
.equ minuteOnes, 21
.equ minuteTwos, 20
.equ minuteFours, 16
.equ minuteEights, 7
.equ minuteSixteens, 8
.equ minuteThirtyTwos, 25
.equ hourOnes, 5
.equ hourTwos, 6
.equ hourFours, 13
.equ hourEights, 19
.equ hourSixteens, 26

.equ secondDelay, 1000

.data

second: .word 0
minute: .word 0
hour:   .word 0
timeDisplay: .asciz "%02d:%02d:%02d\n"

.text
.global main

main:

    push {lr}

    bl wiringPiSetupGpio

    mov r0, #secondOnes
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #secondTwos
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #secondFours
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #secondEights
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #secondSixteens
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #secondThirtyTwos
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #minuteOnes
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #minuteTwos
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #minuteFours
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #minuteEights
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #minuteSixteens
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #minuteThirtyTwos
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #hourOnes
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #hourTwos
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #hourFours
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #hourEights
    mov r1, #OUTPUT
    bl pinMode
    mov r0, #hourSixteens
    mov r1, #OUTPUT
    bl pinMode


    mov r0, #secondOnes
    mov r1, #LOW
    bl digitalWrite
    mov r0, #secondTwos
    mov r1, #LOW
    bl digitalWrite
    mov r0, #secondFours
    mov r1, #LOW
    bl digitalWrite
    mov r0, #secondEights
    mov r1, #LOW
    bl digitalWrite
    mov r0, #secondSixteens
    mov r1, #LOW
    bl digitalWrite
    mov r0, #secondThirtyTwos
    mov r1, #LOW
    bl digitalWrite
    mov r0, #minuteOnes
    mov r1, #LOW
    bl digitalWrite
    mov r0, #minuteTwos
    mov r1, #LOW
    bl digitalWrite
    mov r0, #minuteFours
    mov r1, #LOW
    bl digitalWrite
    mov r0, #minuteEights
    mov r1, #LOW
    bl digitalWrite
    mov r0, #minuteSixteens
    mov r1, #LOW
    bl digitalWrite
    mov r0, #minuteThirtyTwos
    mov r1, #LOW
    bl digitalWrite
    mov r0, #hourOnes
    mov r1, #LOW
    bl digitalWrite
    mov r0, #hourTwos
    mov r1, #LOW
    bl digitalWrite
    mov r0, #hourFours
    mov r1, #LOW
    bl digitalWrite
    mov r0, #hourEights
    mov r1, #LOW
    bl digitalWrite
    mov r0, #hourSixteens
    mov r1, #LOW
    bl digitalWrite

whileLoopHour:

        //condition in while loop basically. checks to see if second is less than 60
        ldr r1, =hour
        ldr r1, [r1]
        cmp r1, #24
        beq hourEnd

        //delay onesOff printf
        ldr r1, =hour
        ldr r1, [r1]
        movs r1, r1, lsr#1
        bcs hourOnesOn
        mov r0, #hourOnes
        mov r1, #LOW
        bl digitalWrite
        //twosOff
        ldr r1, =hour
        ldr r1, [r1]
        movs r1, r1, lsr#2
        bcs hourTwosOn
        mov r0, #hourTwos
        mov r1, #LOW
        bl digitalWrite
        //foursOff
        ldr r1, =hour
        ldr r1, [r1]
        movs r1, r1, lsr#3
        bcs hourFoursOn
        mov r0, #hourFours
        mov r1, #LOW
        bl digitalWrite
        //eightsOff
        ldr r1, =hour
        ldr r1, [r1]
        movs r1, r1, lsr#4
        bcs hourEightsOn
        mov r0, #hourEights
        mov r1, #LOW
        bl digitalWrite
        //sixteensOff
        ldr r1, =hour
        ldr r1, [r1]
        movs r1, r1, lsr#5
        bcs hourSixteensOn
        mov r0, #hourSixteens
        mov r1, #LOW
        bl digitalWrite
        b whileLoopMinute ///if/else ends so continue to next portion in while loop which is the while loop for minute

    hourOnesOn:
        mov r0, #hourOnes
        mov r1, #HIGH
        bl digitalWrite
        b whileLoopMinute

    hourTwosOn:
        mov r0, #hourTwos
        mov r1, #HIGH
        bl digitalWrite
        b whileLoopMinute

    hourFoursOn:
        mov r0, #hourFours
        mov r1, #HIGH
        bl digitalWrite
        b whileLoopMinute

    hourEightsOn:
        mov r0, #hourEights
        mov r1, #HIGH
        bl digitalWrite
        b whileLoopMinute

    hourSixteensOn:
        mov r0, #hourSixteens
        mov r1, #HIGH
        bl digitalWrite
        b whileLoopMinute

    whileLoopMinute:

            //condition in while loop basically. checks to see if second is less than 60
            ldr r1, =minute
            ldr r1, [r1]
            cmp r1, #60
            beq minuteEnd

            //delay onesOff printf
            ldr r1, =minute
            ldr r1, [r1]
            movs r1, r1, lsr#1
            bcs minuteOnesOn
            mov r0, #minuteOnes
            mov r1, #LOW
            bl digitalWrite
            //twosOff
            ldr r1, =minute
            ldr r1, [r1]
            movs r1, r1, lsr#2
            bcs minuteTwosOn
            mov r0, #minuteTwos
            mov r1, #LOW
            bl digitalWrite
            //foursOff
            ldr r1, =minute
            ldr r1, [r1]
            movs r1, r1, lsr#3
            bcs minuteFoursOn
            mov r0, #minuteFours
            mov r1, #LOW
            bl digitalWrite
            //eightsOff
            ldr r1, =minute
            ldr r1, [r1]
            movs r1, r1, lsr#4
            bcs minuteEightsOn
            mov r0, #minuteEights
            mov r1, #LOW
            bl digitalWrite
            //sixteensOff
            ldr r1, =minute
            ldr r1, [r1]
            movs r1, r1, lsr#5
            bcs minuteSixteensOn
            mov r0, #minuteSixteens
            mov r1, #LOW
            bl digitalWrite
            //thirtyTwosOff
            ldr r1, =minute
            ldr r1, [r1]
            movs r1, r1, lsr#6
            bcs minuteThirtyTwosOn
            mov r0, #minuteThirtyTwos
            mov r1, #LOW
            bl digitalWrite
            b whileLoopSecond ///if/else ends so continue to next portion in while loop which is the while loop for second

        minuteOnesOn:
            mov r0, #minuteOnes
            mov r1, #HIGH
            bl digitalWrite
            b whileLoopSecond

        minuteTwosOn:
            mov r0, #minuteTwos
            mov r1, #HIGH
            bl digitalWrite
            b whileLoopSecond

        minuteFoursOn:
            mov r0, #minuteFours
            mov r1, #HIGH
            bl digitalWrite
            b whileLoopSecond

        minuteEightsOn:
            mov r0, #minuteEights
            mov r1, #HIGH
            bl digitalWrite
            b whileLoopSecond

        minuteSixteensOn:
            mov r0, #minuteSixteens
            mov r1, #HIGH
            bl digitalWrite
            b whileLoopSecond

        minuteThirtyTwosOn:
            mov r0, #minuteThirtyTwos
            mov r1, #HIGH
            bl digitalWrite
            b whileLoopSecond



        whileLoopSecond:

                //condition in while loop basically. checks to see if second is less than 60
                ldr r1, =second
                ldr r1, [r1]
                cmp r1, #60
                beq secondEnd
                //if/else statements inside while loop
                //delay onesOff printf
                ldr r1, =second
                ldr r1, [r1]
                movs r1, r1, lsr#1
                bcs secondOnesOn
                ldr r0, =secondDelay
                bl delay
                mov r0, #secondOnes
                mov r1, #LOW
                bl digitalWrite
                ldr r0, =timeDisplay
                ldr r1, =hour
                ldr r1, [r1]
                ldr r2, =minute
                ldr r2, [r2]
                ldr r3, =second
                ldr r3, [r3]
                bl printf
                //twosOff
                ldr r1, =second
                ldr r1, [r1]
                movs r1, r1, lsr#2
                bcs secondTwosOn
                mov r0, #secondTwos
                mov r1, #LOW
                bl digitalWrite
                //foursOff
                ldr r1, =second
                ldr r1, [r1]
                movs r1, r1, lsr#3
                bcs secondFoursOn
                mov r0, #secondFours
                mov r1, #LOW
                bl digitalWrite
                //eightsOff
                ldr r1, =second
                ldr r1, [r1]
                movs r1, r1, lsr#4
                bcs secondEightsOn
                mov r0, #secondEights
                mov r1, #LOW
                bl digitalWrite
                //sixteensOff
                ldr r1, =second
                ldr r1, [r1]
                movs r1, r1, lsr#5
                bcs secondSixteensOn
                mov r0, #secondSixteens
                mov r1, #LOW
                bl digitalWrite
                //thirtyTwosOff
                ldr r1, =second
                ldr r1, [r1]
                movs r1, r1, lsr#6
                bcs secondThirtyTwosOn
                mov r0, #secondThirtyTwos
                mov r1, #LOW
                bl digitalWrite
                b increment //if/else ends so continue to next portion in while loop which is incrementing second

            secondOnesOn:
                ldr r0, =secondDelay
                bl delay
                mov r0, #secondOnes
                mov r1, #HIGH
                bl digitalWrite
                ldr r0, =timeDisplay
                ldr r1, =hour
                ldr r1, [r1]
                ldr r2, =minute
                ldr r2, [r2]
                ldr r3, =second
                ldr r3, [r3]
                bl printf
                b increment

            secondTwosOn:
                mov r0, #secondTwos
                mov r1, #HIGH
                bl digitalWrite
                b increment

            secondFoursOn:
                mov r0, #secondFours
                mov r1, #HIGH
                bl digitalWrite
                b increment

            secondEightsOn:
                mov r0, #secondEights
                mov r1, #HIGH
                bl digitalWrite
                b increment

            secondSixteensOn:
                mov r0, #secondSixteens
                mov r1, #HIGH
                bl digitalWrite
                b increment

            secondThirtyTwosOn:
                mov r0, #secondThirtyTwos
                mov r1, #HIGH
                bl digitalWrite
                b increment

                increment:

                //increment second
                ldr r1, =second
                ldr r1, [r1]
                add r6, r1, #1
                ldr r1, =second
                str r6, [r1]

                b whileLoopSecond //continue looping

        secondEnd:

            ldr r1, =second
            ldr r1, [r1]
            mov r6, #0
            ldr r1, =second
            str r6, [r1]

            mov r0, #secondOnes
            mov r1, #LOW
            bl digitalWrite
            mov r0, #secondTwos
            mov r1, #LOW
            bl digitalWrite
            mov r0, #secondFours
            mov r1, #LOW
            bl digitalWrite
            mov r0, #secondEights
            mov r1, #LOW
            bl digitalWrite
            mov r0, #secondSixteens
            mov r1, #LOW
            bl digitalWrite
            mov r0, #secondThirtyTwos
            mov r1, #LOW
            bl digitalWrite

            ldr r1, =minute
            ldr r1, [r1]
            add r6, r1, #1
            ldr r1, =minute
            str r6, [r1]

            b whileLoopMinute


    minuteEnd:

        ldr r1, =minute
        ldr r1, [r1]
        mov r6, #0
        ldr r1, =minute
        str r6, [r1]

        mov r0, #minuteOnes
        mov r1, #LOW
        bl digitalWrite
        mov r0, #minuteTwos
        mov r1, #LOW
        bl digitalWrite
        mov r0, #minuteFours
        mov r1, #LOW
        bl digitalWrite
        mov r0, #minuteEights
        mov r1, #LOW
        bl digitalWrite
        mov r0, #minuteSixteens
        mov r1, #LOW
        bl digitalWrite
        mov r0, #minuteThirtyTwos
        mov r1, #LOW
        bl digitalWrite

        ldr r1, =hour
        ldr r1, [r1]
        add r6, r1, #1
        ldr r1, =hour
        str r6, [r1]

        b whileLoopHour

hourEnd:

        ldr r1, =hour
        ldr r1, [r1]
        mov r6, #0
        ldr r1, =hour
        str r6, [r1]

        mov r0, #hourOnes
        mov r1, #LOW
        bl digitalWrite
        mov r0, #hourTwos
        mov r1, #LOW
        bl digitalWrite
        mov r0, #hourFours
        mov r1, #LOW
        bl digitalWrite
        mov r0, #hourEights
        mov r1, #LOW
        bl digitalWrite
        mov r0, #hourSixteens
        mov r1, #LOW
        bl digitalWrite

        b whileLoopHour


    mov r0, #0
    pop {pc}

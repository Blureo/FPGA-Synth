module wave_period_calculator
(
    input  logic clk,
    input  logic rst,

    input  logic key1,
    input  logic key2,
    input  logic key3,
    input  logic key4,
    input  logic key5,
    input  logic key6,
    input  logic key7,
    input  logic key8,
    input  logic key9,
    input  logic key10,
    input  logic key11,
    input  logic key12,
    
    output logic [7:0] halfPeriod
);

    /* NEED TO FIND WAVE TIME FOR EACH FREQUENCY
        sample rate = 48 kHz –> 3.072 MHz / 32 bits / 2 cycles = 48 kHz

        Divide 48 kHz by note frequency; that is time for 1 cycle.
        Divide that time by 2 to get time for one high (or low) signal duration.
        Units of clk cycles
    */

    localparam HalfPeriod1  = 92; // 0x5C | C4  = 261.6 Hz
    localparam HalfPeriod2  = 87; // 0x57 | C#4 = 277.2 Hz
    localparam HalfPeriod3  = 82; // 0x52 | D4  = 293.7 Hz
    localparam HalfPeriod4  = 77; // 0x4D | Eb4 = 311.1 Hz
    localparam HalfPeriod5  = 73; // 0x49 | E4  = 329.6 Hz
    localparam HalfPeriod6  = 69; // 0x45 | F4  = 349.2 Hz
    localparam HalfPeriod7  = 65; // 0x41 | F#4 = 370.0 Hz
    localparam HalfPeriod8  = 61; // 0x3D | G4  = 392.0 Hz
    localparam HalfPeriod9  = 58; // 0x3A | G#4 = 415.3 Hz
    localparam HalfPeriod10 = 55; // 0x37 | A4  = 440.0 Hz
    localparam HalfPeriod11 = 51; // 0x33 | Bb4 = 466.2 Hz
    localparam HalfPeriod12 = 49; // 0x31 | B4  = 493.9 Hz
    
    logic [7:0] nextHalfPeriod;

    // calculate wave half-period
    always_comb begin
        nextHalfPeriod = 0;

        if (key1) nextHalfPeriod = HalfPeriod1;
        else if (key2)  nextHalfPeriod = HalfPeriod2;
        else if (key3)  nextHalfPeriod = HalfPeriod3;
        else if (key4)  nextHalfPeriod = HalfPeriod4;
        else if (key5)  nextHalfPeriod = HalfPeriod5;
        else if (key6)  nextHalfPeriod = HalfPeriod6;
        else if (key7)  nextHalfPeriod = HalfPeriod7;
        else if (key8)  nextHalfPeriod = HalfPeriod8;
        else if (key9)  nextHalfPeriod = HalfPeriod9;
        else if (key10) nextHalfPeriod = HalfPeriod10;
        else if (key11) nextHalfPeriod = HalfPeriod11;
        else if (key12) nextHalfPeriod = HalfPeriod12;
        else nextHalfPeriod = 0;

        halfPeriod = nextHalfPeriod;
    end

endmodule
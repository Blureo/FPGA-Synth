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
    
    output logic [9:0] halfPeriodTotal
);

    logic [11:0] key;
    assign key[0]  = key1;
    assign key[1]  = key2;
    assign key[2]  = key3;
    assign key[3]  = key4;
    assign key[4]  = key5;
    assign key[5]  = key6;
    assign key[6]  = key7;
    assign key[7]  = key8;
    assign key[8]  = key9;
    assign key[9] = key10;
    assign key[10] = key11;
    assign key[11] = key12;

    /* NEED TO FIND WAVE TIME FOR EACH FREQUENCY
        sample rate = 48 kHz –> 3.072 MHz / 32 bits / 2 cycles = 48 kHz

        Divide 48 kHz by note frequency; that is time for 1 cycle.
        Divide that time by 2 to get time for one high (or low) signal duration.
        Units of clk cycles

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
    */

    const byte noteHalfPeriod[12] = '{92, 87, 82, 77, 73, 69, 65, 61, 58, 55, 51, 49}; // in units of clk cycles
    logic [3:0] numberOfKeysPressed;
    logic [9:0] nextHalfPeriod;
    logic noKeysPressed; // acts as a boolean

    // calculate wave half-period
    always_comb begin
        numberOfKeysPressed = 0;
        nextHalfPeriod = 0;
        noKeysPressed = 1; // // noKeysPressed = true

        foreach (key[i]) begin
            if (key[i]) begin
                numberOfKeysPressed = numberOfKeysPressed + 1;
                nextHalfPeriod = nextHalfPeriod + noteHalfPeriod[i];
                noKeysPressed = 0; // noKeysPressed = false
            end
        end

        if (!noKeysPressed) begin // to avoid division by zero
            nextHalfPeriod = nextHalfPeriod / numberOfKeysPressed;
            halfPeriodTotal = nextHalfPeriod;
        end
        else halfPeriodTotal = 0;
    end

endmodule
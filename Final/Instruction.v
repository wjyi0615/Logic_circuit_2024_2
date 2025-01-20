module Rom6 (
	input wire write,
   input wire Address1, Address2, Address3, Address4, Address5, Address6,
   input wire IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8,
   input wire clk,
   output reg out1, out2, out3, out4, out5, out6, out7, out8
);

    // 주소 및 데이터 입력 벡터로 변환
    wire [5:0] address = {Address6, Address5, Address4, Address3, Address2, Address1};

    // 데이터 출력 (등록된 데이터 출력)
    reg [7:0] data_out;

    // RAM 선언 (64 x 8 메모리)
    reg [7:0] ram [63:0];

    // 초기화
    initial begin
        $readmemh("Rom.hex", ram);
    end

    // RAM 읽기/쓰기 로직
    always @(posedge clk) begin
        data_out <= ram[address]; // 읽기
    end

    // 데이터 출력 매핑
    always @(*) begin
        {out8, out7, out6, out5, out4, out3, out2, out1} = data_out;
    end

endmodule

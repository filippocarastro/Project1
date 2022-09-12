// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

//		
// Project:	A Real--time Clock Core
//
// Purpose:	Converts a 4'bit hexadecimal value to the seven bits needed
//		by a seven segment display, specifying which bits are on and
//		which are off.
//
//		The display I am working with, however, requires a separate
//		controller.  This file only provides part of the input for that
//		controller.  That controller deals with turning on each part
//		of the display in a rotating fashion, since the hardware I have
//		cannot display more than one character at a time.  So,
//		buyer beware--this is not a complete seven segment display
//		solution.
//
//
//		The outputs of this routine are numbered as follows:
//			o_map[7] turns on the bar at the top of the display
//			o_map[6] turns on the top of the '1'
//			o_map[5] turns on the bottom of a '1'
//			o_map[4] turns on the bar at the bottom of the display
//			o_map[3] turns on the vertical bar at the bottom left
//			o_map[2] turns on the vertical bar at the top left, and
//			o_map[1] turns on the bar in the middle of the display.
//				The dash if you will.
//		Bit zero, from elsewhere, would be the decimal point.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Tecnology, LLC
//

module	hexmap(i_clk, i_hex, o_map);
	input		i_clk;
	input	[3:0]	i_hex;
	output	reg	[7:1]	o_map;

	always @(posedge i_clk)
		case(i_hex)
		4'h0:	o_map <= { 7'b1111110 };
		4'h1:	o_map <= { 7'b0110000 };
		4'h2:	o_map <= { 7'b1101101 };
		4'h3:	o_map <= { 7'b1111001 };
		4'h4:	o_map <= { 7'b0110011 };
		4'h5:	o_map <= { 7'b1011011 };
		4'h6:	o_map <= { 7'b1011111 };
		4'h7:	o_map <= { 7'b1110000 };
		4'h8:	o_map <= { 7'b1111111 };
		4'h9:	o_map <= { 7'b1111011 };
		4'ha:	o_map <= { 7'b1110111 };
		4'hb:	o_map <= { 7'b0011111 }; // b
		4'hc:	o_map <= { 7'b1001110 };
		4'hd:	o_map <= { 7'b0111101 }; // d
		4'he:	o_map <= { 7'b1001111 };
		4'hf:	o_map <= { 7'b1000111 };
		endcase
endmodule

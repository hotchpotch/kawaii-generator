package com.rails2u.kgen {
    import flash.display.BitmapData;
    import sketchbook.colors.ColorSB;
    import com.rails2u.kgen.parts.Face;
    public class KawaiiGenerator {
        public function KawaiiGenerator():void {
        }

        public function generate():BitmapData {
            var bd:BitmapData = new BitmapData(16, 16, true, 0x00000000);
            var mainCol:ColorSB = new ColorSB(0x000000);
            var subColor:ColorSB = new ColorSB(0xFFFFFF);

            var face:Face = new Face();
            face.draw(bd);
            return bd;
        }
    }
}

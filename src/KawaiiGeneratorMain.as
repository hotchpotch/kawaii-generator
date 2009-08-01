package {
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import com.rails2u.kgen.KawaiiGenerator;
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import flash.geom.Matrix;

    [SWF(frameRate=60, background=0x000000)]
    public class KawaiiGeneratorMain extends Sprite {
        public function KawaiiGeneratorMain() {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            init();
        }

        public function init():void {
            var kg:KawaiiGenerator = new KawaiiGenerator;
            var bd:BitmapData = new BitmapData(240, 240, true, 0xFFF0F0F0);
            var b:Bitmap = new Bitmap(bd);
            b.scaleX = b.scaleY = 3;
            addChild(b);
            var m:Matrix = new Matrix;
            while (m.tx < bd.width) {
                while (m.ty < bd.height) {
                    var gb:BitmapData = kg.generate();
                    bd.draw(gb, m);
                    m.ty += 16;
                }
                m.tx += 16;
                m.ty = 0;
            }
        }
    }
}


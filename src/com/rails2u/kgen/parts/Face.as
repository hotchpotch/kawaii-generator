package com.rails2u.kgen.parts {
    import com.rails2u.utils.MathUtil;
    import sketchbook.colors.ColorSB;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    public class Face {
        protected var borderHeight:uint;
        protected var borderWidth:uint;
        protected var round:uint;
        protected var mainColor:ColorSB;
        protected var subColor:ColorSB;

        protected const SIZE:uint = 16;

        public function Face():void {
            init();
        }

        public function init():void {
            borderHeight = MathUtil.randomPickup(7, 7, 8, 8, 7, 7, 8, 8, 9, 10);
            borderWidth = MathUtil.randomPickup(8,10,10,12);
            round = MathUtil.randomPickup(0,1,0,1, 1);
            mainColor = new ColorSB(0x555555);
            subColor  = new ColorSB(0xFFFFFF);
        }

        public function get mainColorRGBA():uint {
            return 0xFF000000 | mainColor.value;
        }

        public function get subColorRGBA():uint {
            return 0xFF000000 | subColor.value;
        }

        public function draw(bd:BitmapData) {
            var fr:Rectangle = faceRect;
            bd.fillRect(fr, mainColorRGBA);
            if (round == 1) {
                bd.setPixel32(fr.topLeft.x, fr.topLeft.y, 0x00000000);
                bd.setPixel32(fr.topLeft.x + fr.width - 1, fr.topLeft.y, 0x00000000);
                bd.setPixel32(fr.topLeft.x, fr.topLeft.y + fr.height- 1, 0x00000000);
                bd.setPixel32(fr.bottomRight.x- 1, fr.bottomRight.y- 1, 0x00000000);
            }
            drawEyes(bd, fr);
            drawMouth(bd, fr);
        }

        public function drawMouth(bd:BitmapData, fr:Rectangle):void {
            var mode:uint = MathUtil.randomPickup(0,0,0,1,2);
            var widthMargin:uint = 2;
            var heightMargin:uint = 2;
            if (borderHeight > 8 && MathUtil.randomPickup(0,1,2)) heightMargin++;
            if (mode == 0) {
                if (borderWidth > 8 && MathUtil.randomPickup(0,1,1)) widthMargin ++;
                var lineRect:Rectangle = new Rectangle(
                    fr.topLeft.x + widthMargin,
                    fr.topLeft.y + borderHeight - heightMargin,
                    fr.width - widthMargin * 2,
                    1
                );
                bd.fillRect(lineRect, subColorRGBA);
            } else if (mode == 1) {
                var lineRect:Rectangle = new Rectangle(
                    SIZE/2-1,
                    fr.topLeft.y + borderHeight - heightMargin,
                    2,
                    1
                );
                bd.fillRect(lineRect, subColorRGBA);
            } else if (mode == 2) {
                var lineRect:Rectangle = new Rectangle(
                    SIZE/2-2,
                    fr.topLeft.y + borderHeight - heightMargin,
                    4,
                    1
                );
                bd.fillRect(lineRect, subColorRGBA);
            }
        }

        public function drawEyes(bd:BitmapData, fr:Rectangle):void {
            var heightMargin:uint = 1;
            var widthMargin:uint = 1;
            if (round == 1) heightMargin += 1;
            var mode:uint = MathUtil.randomPickup(0,1,1,1,2,2,1,1,1,2,2,4);
            if (borderWidth >= 10 && MathUtil.randomPickup(0,0,1) == 1) widthMargin += 1;

            if (mode == 0) {
                widthMargin = 1;
                if (MathUtil.randomBoolean()) heightMargin += 1;
                bd.setPixel32(fr.topLeft.x + widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 1 - widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
            } else if (mode == 1) {
                if (borderWidth >= 10 && widthMargin == 1 && MathUtil.randomBoolean()) widthMargin += 1;
                bd.setPixel32(fr.topLeft.x + widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + widthMargin, fr.topLeft.y + heightMargin + 1, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 1 - widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 1 - widthMargin, fr.topLeft.y + heightMargin + 1, subColorRGBA);
            } else if (mode == 2) {
                bd.setPixel32(fr.topLeft.x + widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + widthMargin, fr.topLeft.y + heightMargin + 1, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + widthMargin, fr.topLeft.y + heightMargin + 2, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 1 - widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 1 - widthMargin, fr.topLeft.y + heightMargin + 1, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 1 - widthMargin, fr.topLeft.y + heightMargin + 2, subColorRGBA);
            } else if (mode == 3) {
                widthMargin = 1;
                bd.setPixel32(fr.topLeft.x + widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + widthMargin, fr.topLeft.y + heightMargin + 1, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + widthMargin + 1, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + widthMargin + 1, fr.topLeft.y + heightMargin + 1, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 1 - widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 1 - widthMargin, fr.topLeft.y + heightMargin + 1, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 2 - widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 2 - widthMargin, fr.topLeft.y + heightMargin + 1, subColorRGBA);
            } else if (mode == 4) {
                if (heightMargin == 1 && MathUtil.randomBoolean()) heightMargin++;
                bd.setPixel32(fr.topLeft.x + widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + widthMargin + 1, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 1 - widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
                bd.setPixel32(fr.topLeft.x + fr.width - 2 - widthMargin, fr.topLeft.y + heightMargin, subColorRGBA);
            }
        }
        
        public function get faceRect():Rectangle {
            var lt:Point = leftTop;
            return new Rectangle(lt.x, lt.y, borderWidth, borderHeight);
        }

        public function get leftTop():Point {
            return new Point((SIZE - borderWidth)/2 , 8 - uint(borderHeight/2));
        }
    }
}

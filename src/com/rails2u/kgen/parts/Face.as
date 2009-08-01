package com.rails2u.kgen.parts {
    import com.rails2u.utils.MathUtil;
    public class Face {
        protected var borderHeight:uint;
        protected var borderWidth:uint;
        protected var round:uint;

        public function Face():void {
            init();
        }

        public function init():void {
            borderHeight = MathUtil.randomPickup(7, 8);
            borderWidth = MathUtil.randomPickup(8,10,10,20);
            log(borderHeight);
        }
    }
}

package com.cloudwebrtc.fluttertouchvg;

import rhcad.touchvg.IGraphView;
import rhcad.touchvg.IGraphView.OnSelectionChangedListener;
import rhcad.touchvg.IViewHelper;
import android.content.Context;
import android.view.ViewGroup;
import android.widget.FrameLayout;

public class TouchVGView extends ViewGroup implements OnSelectionChangedListener {
    private IViewHelper mHelper = null;
    private static final String PATH = "mnt/sdcard/WhiteBoard/";

    FrameLayout layout;

    public TouchVGView(Context context, IViewHelper helper) {
        super(context);
        mHelper = helper;
        mHelper.createGraphView(context, this);
        mHelper.getGraphView().setOnSelectionChangedListener(this);
//        mHelper.startUndoRecord(PATH + "undo");
//        mHelper.setBackgroundDrawable(this.getResources().getDrawable(R.drawable.background_repeat));

    }

    public IViewHelper helper(){
        return  this.mHelper;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int height = b - t;
        int width = r - l;
        mHelper.getView().layout(l,t - 100, r, b - 100);
    }

    @Override
    public void onSelectionChanged(IGraphView view) {

    }
}

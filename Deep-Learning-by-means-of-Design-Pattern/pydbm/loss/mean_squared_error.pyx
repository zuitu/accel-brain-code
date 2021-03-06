# -*- coding: utf-8 -*-
import numpy as np
cimport numpy as np
from pydbm.loss.interface.computable_loss import ComputableLoss


class MeanSquaredError(ComputableLoss):
    '''
    The mean squared error (MSE).
    '''

    def compute_loss(self, np.ndarray pred_arr, np.ndarray labeled_arr, axis=None):
        '''
        Return of result from this Cost function.

        Args:
            pred_arr:       Predicted data.
            labeled_arr:    Labeled data.
            axis:           Axis or axes along which the losses are computed.
                            The default is to compute the losses of the flattened array.

        Returns:
            Cost.
        '''
        return np.square(labeled_arr - pred_arr).mean(axis=axis)

    def compute_delta(self, np.ndarray pred_arr, np.ndarray labeled_arr, delta_output=1):
        '''
        Backward delta.
        
        Args:
            pred_arr:       Predicted data.
            labeled_arr:    Labeled data.
            delta_output:   Delta.

        Returns:
            Delta.
        '''
        batch_size = labeled_arr.shape[0]
        return (pred_arr - labeled_arr) / batch_size * delta_output

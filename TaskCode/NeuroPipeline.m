function varargout = NeuroPipeline(Neuro,Data),
% function Neuro = NeuroPipeline(Neuro)
% function [Neuro,Data] = NeuroPipeline(Neuro,Data)
% Neuro processing pipeline. To change processing, edit this function.

% process neural data
Neuro = ReadBR(Neuro);
Neuro = RefNeuralData(Neuro);
Neuro = ApplyFilterBank(Neuro);
Neuro = CompNeuralFeatures(Neuro);
Neuro = UpdateChStats(Neuro);
varargout{1} = Neuro;

% if Data exists and is not empty, fill structure
if exist('Data','var') && ~isempty(Data),
    Data.NeuralTimeBR(end+1,1) = Neuro.TimeStamp;
    Data.NeuralSamps(end+1,1) = Neuro.NumSamps;
    Data.NeuralFeatures(:,:,end+1) = Neuro.NeuralFeatures;
    Data.ProcessedData{end+1} = Neuro.FilteredData;
    varargout{2} = Data;
end

end % ProcessNeuro
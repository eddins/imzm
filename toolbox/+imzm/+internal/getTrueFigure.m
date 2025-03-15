function fig = getTrueFigure(fig)
    if feature("LiveEditorRunning")
        try
            unsupported_version = isMATLABReleaseOlderThan("R2022a");
        catch
            unsupported_version = true;
        end
        if unsupported_version
            error("imzm:UnsupportedVersion",...
                "MATLAB R2022a or later required for setting or getting image " + ...
                "zoom level when running in a live script.")
        end
        if string(fig.Tag) ~= "EmbeddedFigure_Internal"
            fig = findEmbeddedFigure(fig);
        end
    end
end

function embedded_fig = findEmbeddedFigure(fig)
    embedded_fig = fig;
    try
        data = fig.InternalEditor_Data;
        listeners = data.listener;
        for k = 1:length(listeners)
            fh_details = functions(listeners(k).Callback);
            if isfield(fh_details,"workspace")
                w = fh_details.workspace{1};
                if isfield(w,"editorId")
                    id = w.editorId;
                    matching_embedded_figs = findall(groot,"type","figure",...
                        "Tag",'EmbeddedFigure_Internal',...
                        "editorID",id);
                    if ~isempty(matching_embedded_figs)
                        embedded_fig = matching_embedded_figs(1);
                        break
                    else
                        fprintf("No matching embedded figure found; calling drawnow and searching again\n");
                    end
                end
            end
        end
    catch e
        % error("imzm:EmbeddedFigureFailure", ...
        %     "Unexpected failure in finding embedded " + ...
        %     "live script figure.")
        rethrow(e)
    end
end

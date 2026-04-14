public class accountPlugin implements Process.Plugin {
    
    public Process.PluginResult invoke(Process.PluginRequest request){

        return new Process.PluginResult(null);
    }

    public Process.PluginDescribeResult describe(){
        return new Process.PluginDescribeResult();
    }
}
# https://github.com/avaughn271/AdmixtureBayes
cd /data01/wangyf/project2/CyprinusCarpio/15.pop/1.plink+admix/2.convertf/AdmixtureBayes

# 1.运行MCMC
# 输入文件adbayesinput.txt文件为R中运行/data01/wangyf/software/ConvertFromVCF.R脚本转换而来,该脚本中有指令

python /data01/wangyf/project2/CyprinusCarpio/15.pop/1.plink+admix/2.convertf/AdmixtureBayes/AdmixtureBayes/admixturebayes/runMCMC.py --input_file adbayesinput.txt --outgroup DN --result_file mcmc_samples.csv

# 2.分析样本
python /data01/wangyf/project2/CyprinusCarpio/15.pop/1.plink+admix/2.convertf/AdmixtureBayes/AdmixtureBayes/admixturebayes/analyzeSamples.py --mcmc_results mcmc_samples.csv --result_file thinned_samples.csv

# 3.制图
# 顶级树 --top_trees_to_plot（可选）要绘制的顶级树的数量，默认为3
python /data01/wangyf/project2/CyprinusCarpio/15.pop/1.plink+admix/2.convertf/AdmixtureBayes/AdmixtureBayes/admixturebayes/makePlots.py --posterior thinned_samples.csv --plot top_trees --output_prefix top_trees

# 带有分支估计的顶级树 --top_trees_to_estimate（可选）要绘制的具有分支估计值的顶级树的数量，默认为3
python /data01/wangyf/project2/CyprinusCarpio/15.pop/1.plink+admix/2.convertf/AdmixtureBayes/AdmixtureBayes/admixturebayes/makePlots.py --posterior thinned_samples.csv --plot estimates --output_prefix estimates

# 顶级节点树 --top_minimal_topologies_to_plot（可选）要绘制的最小拓扑数量，默认为3
python /data01/wangyf/project2/CyprinusCarpio/15.pop/1.plink+admix/2.convertf/AdmixtureBayes/AdmixtureBayes/admixturebayes/makePlots.py --posterior thinned_samples.csv --plot top_minimal_topologies --output_prefix top_minimal_topologies --write_rankings top_minimal_topologies.txt

# 共识树
python /data01/wangyf/project2/CyprinusCarpio/15.pop/1.plink+admix/2.convertf/AdmixtureBayes/AdmixtureBayes/admixturebayes/makePlots.py --posterior thinned_samples.csv --plot consensus_trees --output_prefix consensus_trees
